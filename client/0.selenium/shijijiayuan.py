#! -coding:utf8 -*-
from selenium import webdriver
import time
import re
# from pyquery import PyQuery as pq
# import csv
# from bs4 import BeautifulSoup
# import threading

from tomorrow import threads

@threads(10)

def write_file(data):
  with open("0.csv", 'a+') as f:
    writer = f.write(data+'\n')
    #先写入columns_name
  pass

login_url="http://login.jiayuan.com/"
browser = webdriver.Chrome()  # 打开浏览器

browser.get(login_url)  # 进入相关网站


browser.find_element_by_id("login_email").send_keys("18516503754")
browser.find_element_by_id("login_password").send_keys("199101212")

browser.find_element_by_id("login_btn").click()


def check_page_info(user_url):
    try:
        # browser.find_element_by_link_text("她的照片(7)")
        # res = browser.find_element_by_class_name("nav_l").text
        browser.get(user_url)
        res = browser.find_element_by_css_selector("body > div.subnav_box.yh > div > ul > li:nth-child(2) > a")
        link_title=res.text
        if "的照片" in link_title:
            num = int(link_title.split('(')[1].strip(")"))
            if num > 2 :
                data = str(num) + "," + str(i)  + "," + res.get_attribute("href")
                print (data)
                write_file(data)
    except Exception as e:
        print (".", format(e))

    pass


# 修改用户 ID
# todo 1000000-1101111
# 1111111-1121111
# 1121111-1131111
# donging 1131111-1141111
for i in range(1020828, 1101111):

    print ("--------:", i)
    user_url="http://www.jiayuan.com/" + str(i)
    check_page_info(user_url)

browser.quit()
