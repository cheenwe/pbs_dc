#! -coding:utf8 -*-
import requests, time, random, json

from bs4 import BeautifulSoup
from pyquery import PyQuery as pq
from tomorrow import threads

# 引入模块
# from RestApi import RestApi

# from daili import new_ip, del_ip

s_id = 2938511 #175576879
e_id = 4860000 #h195576880

aim_url = "http://m.jiayuan.com/"

### API
host = 'http://192.168.100.214:3000'

def create_user(self, data):
  r = requests.post(host + '/api/v1/dc/users', data=data)
  print(r.text)

### DAILI
daili_ip = 'http://192.168.101.5:8000'

def new_ip():
    r = requests.get(daili_ip)
    ip_ports = json.loads(r.text)
    ip_ports = random.choice(ip_ports)
    # print(ip_ports)
    ip = ip_ports[0]
    port = ip_ports[1]

    proxies = {
        'http': 'http://%s:%s' % (ip, port),
        'https': 'http://%s:%s' % (ip, port)
    }
    print(proxies)
    return [proxies, ip]

def del_ip(ip):
    r = requests.get(daili_ip + '/delete?ip='+ip)
    print(r.text)

# 初始化API
# api = RestApi()

def create_user(data):
  try:
    api.create_user(data)
  except Exception as e:
    print (" api request fail   .   .   . ", format(e)) # 接口请求失败

def write_file(data):
        file_name=str(s_id)+"_"+str(e_id)+"_with_pics.csv"
        print(file_name)
        with open(file_name, 'a+') as f:
                writer = f.write(data+'\n')

# @threads(10)
def check_html(data, sn):
        # photo_list_text = data.find_all('ul', class_="nav_l")[0].find_all('li')[1].get_text()  # .find_all("a").get_text()
        # photo_list_text = data.find_all('ul', class_="nav_l")[0].find_all('li')[1].get_text()  # .find_all("a").get_text()
        try:
                nav_text = data.find('div', class_="small_pic fn-clear")

                # print(nav_text)

                photo_links = nav_text.find_all('li')
                # photo_title = photo_text.text

                # print(len(photo_links))

                num = len(photo_links)
                if num > 2 :
                        photo_lik=photo_links[0].find('a').get("href")

                        photo_hash = photo_lik.split('uid_hash=')[1].split('&')[0]

                        urls = ""
                        for li_single in photo_links:
                                link = li_single.find('img').get("_src")
                                # print(link)
                                urls = urls +", "+ link
                                pass

                        data = str(num) + ", " + str(sn)  + ", " + photo_lik + urls

                        # print (data)
                        write_file(data)

                        d = {'uid': sn, 'photo_num': num, 'photo_hash': photo_hash, 'sign': 1, }

                        create_user(d)


        except Exception as e:
                print ("x               x               x", format(e))
        pass


proxies = new_ip()

# @threads(5)
def visit_page(sn, proxies):

        url= aim_url + str(sn)

        headers={
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2',
        'Cache-Control': 'max-age=0',
        'Connection': 'keep-alive',
        'Host': '***',
        'Referer': aim_url
        }

        rs=requests.get(url, proxies=proxies, headers=headers,verify=False)
        rs.encoding='utf-8'
        # print(rs.text)
        data = BeautifulSoup(rs.text, "lxml")
        # print(rs.text)
        check_html(data, sn)

for i in range(s_id,e_id):
        print(i)
        visit_page(i, proxies[0])
