# coding =utf-8

import requests
import json
import random

daili_ip = 'http://192.168.101.5:8000'

def new_ip():
    r = requests.get(daili_ip).text
    ip_ports = json.loads(proxy)

    max_num = len(ip_ports)
    num = random.randint(0,max_num)

    print("random num: %s", num)
    ip_ports = ip_ports[num]
    print(ip_ports)
    ip = ip_ports[0]
    port = ip_ports[1]
    proxies = {
        'http': 'http://%s:%s' % (ip, port),
        'https': 'http://%s:%s' % (ip, port)
    }
    # print(proxies)
    return [proxies, ip]

def new_ip():
  proxy= requests.get("http://192.168.101.5:8000/").text
  #print(proxy)
  ip_ports = json.loads(proxy)
  num = random.randint(0,10)
  print("random num: %s", num)
  ip_ports = ip_ports[num]
  print(ip_ports)
  ip = ip_ports[0]
  port = ip_ports[1]
  return {'http': 'http://%s:%s' % (ip, port)}

def del_ip(ip):
    r = requests.get(daili_ip + '/delete?ip='+ip)
    print(r.text)

# ip()
# # url = "http://2018.ip138.com/ic.asp" #代理 ip
# url = "http://login.jiayuan.com/"

# print(proxies)
# r = requests.get(url, proxies=proxies)
# r.encoding = 'utf-8'
# print(r.text)

# # import urllib.request

# # # 查询IP  http://ip.chinaz.com/getip.aspx
# # url = "http://2018.ip138.com/ic.asp"

# # # url = "http://www.jiayuan.com/165853067"

# # iplist = ['106.75.9.39:8080']

# # proxy_support = urllib.request.ProxyHandler({'http': random.choice(iplist)})
# # opener = urllib.request.build_opener(proxy_support)
# # opener.addheaders = [('User-Agent', 'Test_Proxy_Python3.5_maminyao')]
# # urllib.request.install_opener(opener)
# # response = urllib.request.urlopen(url)
# # html = response.read()
# # print(html)
