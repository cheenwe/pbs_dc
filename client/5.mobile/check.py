#! -coding:utf8 -*-
import requests, time

from bs4 import BeautifulSoup
from pyquery import PyQuery as pq

# from tomorrow import threads

s_id = 16008280
e_id = 20000000

def write_file(data):
        file_name=str(s_id)+"_"+str(e_id)+".csv"
        print(file_name)
        with open(file_name, 'a+') as f:
                writer = f.write(data+'\n')

def check_html(data, sn):
        try:
                nav_text = data.find('div', class_="small_pic fn-clear")

                # print(nav_text)

                photo_links = nav_text.find_all('li')
                # photo_title = photo_text.text

                # print(len(photo_links))

                num = len(photo_links)
                if num > 2 :
                        photo_lik=photo_links[0].find('a').get("href")
                        urls = ""
                        for li_single in photo_links:
                                link = li_single.find('img').get("_src")
                                # print(link)
                                urls = urls +", "+ link
                                pass

                        data = str(num) + ", " + str(sn)  + ", " + photo_lik + urls
                        # print (data)
                        write_file(data)

        except Exception as e:
                print ("x               x               x", format(e))
        pass

# @threads(5)
def visit_page(sn):

        url="http://m.jiayuan.com/" + str(sn)

        headers={
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2',
        'Cache-Control': 'max-age=0',
        'Connection': 'keep-alive',
        'Host': '***',
        'Referer': 'http://www.jiayuan.com/157709283'
        }

        rs=requests.get(url,headers=headers,verify=False)
        rs.encoding='utf-8'
        # print(rs.text)
        data = BeautifulSoup(rs.text, "lxml")
        # print(rs.text)
        check_html(data, sn)


for i in range(s_id,e_id):
        # print(url)
        visit_page(i)
