#! -coding:utf8 -*-
from o.selenium import webdriver
import time
import re
from pyquery import PyQuery as pq
# import csv
from bs4 import BeautifulSoup

from tomorrow import threads

from my_download import download, check_download_dir


out_dir = './output'

check_download_dir(out_dir)

@threads(10)
def write_info(folder_name, data):
	folder_name = folder_name + "/" + "0.csv"
	with open(folder_name, 'a+') as f:
		writer = f.write(data)

login_url = "http://login.jiayuan.com/"
browser = webdriver.Chrome()  # 打开浏览器

browser.get(login_url)  # 进入相关网站

browser.find_element_by_id("login_email").send_keys("18516503754")
browser.find_element_by_id("login_password").send_keys("199101212")

browser.find_element_by_id("login_btn").click()
#登录成功

# 获取单个人照片
def search_photo(photo_url, download_folder):
	folder_name = out_dir + "/" + u_download_folder
	check_download_dir(folder_name)

	browser.get(photo_url)  # 进入相关网站
	html = browser.page_source  # 获取网站源码
	data = str(pq(html))  # str() 函数将对象转化为适于人阅读的形式。
	#print(data)
	data = BeautifulSoup(data, "lxml")

	#判断性别
	photo_list_text = data.find_all('li', class_="cur")[0].get_text()  # .find_all("a").get_text()
	info_list = data.find_all('p', class_="yh")[0].get_text()
	sex_text = photo_list_text.split("的")[0]
	# print(photo_list_text.split("的")[0])
	if sex_text == "他":
		sex_text = "男"
	else:
		sex_text = "女"

	base_info = sex_text + ", " + info_list
	# print(base_info)
	write_info(folder_name, base_info)

	# 检查图片并下载
	dls = data.find(id='phoBig').find("ul").find_all('img')
	# print(dls)
	i = 1
	for target_list in dls:
		url = target_list.get('src')
		print(str(i) + ", " + url)
		i = i + 1
		file_name= str(i) + ".jpg"

		download(url, download_folder, file_name)



#===== 主程序 ======#
# 打开文件获取信息
with open('./shijiejiayuan.csv', 'r') as f:
	for line in f:
		line = line.strip('\n').split(',')
		u_num = line[0]
		u_id = line[1]
		u_url = line[2]
		print(u_url)
		#下载路径
		u_download_folder = u_num + "_" + u_id
		search_photo(u_url, u_download_folder)
		time.sleep(0.2)

browser.quit()

