#! -coding:utf8 -*-
import requests
import time
def GetCookie():
  imgUrl='http://www.jiayuan.com/18126809'
  s=requests.session()
  print(s.cookies.get_dict())#先打印一下，此时一般应该是空的。
  res=s.get(imgUrl,stream=True)
  loginUrl='https://passport.jiayuan.com/dologin.php?host=www.jiayuan.com&pre_url='
  postData={
    'name':'17521507650',
    'password':'17521507650',
    'remem_pass':'on',
    'ajaxsubmit':1,
    'ljg_login':1,
  }

  rs=s.post(loginUrl,postData)
  c=requests.cookies.RequestsCookieJar()#利用RequestsCookieJar获取
  # c.set('cookie-name','cookie-value')
  s.cookies.update(c)
  print(s.cookies.get_dict())

GetCookie()
# def check_html(data):
#     data = BeautifulSoup(data, "lxml")
#     data.find_all(text='下一位更帅~')

  # #判断性别
  # photo_list_text = data.find_all('li', class_="cur")[0].get_text()  # .find_all("a").get_text()
  # info_list = data.find_all('p', class_="yh")[0].get_text()
  # sex_text = photo_list_text.split("的")[0]

# def DirLogin():
#   s=requests.session()
#   url='http://www.jiayuan.com/157709283'
#   headers={
#   'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
#   'Accept-Encoding': 'gzip, deflate',
#   'Accept-Language': 'zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2',
#   'Cache-Control': 'max-age=0',
#   'Connection': 'keep-alive',
#   'Host': '***',
#   'Referer': 'http://www.jiayuan.com/157709283'
#   }
#   cookies={'COMMON_HASH': '458225a40acaf6bd4285d1c23da31052', 'PROFILE': '182103006%3Awahaha%3Am%3Aimages1.jyimg.com%2Fw4%2Fglobal%2Fi%3A0%3A%3A1%3Azwzp_m.jpg%3A1%3A1%3A50%3A10', 'RAW_HASH': 'L8Jg4BcmaAct40qhEmmlPZIE55FwGT6YPbuTi60Qnk52xDPDdKg9z7KIx7Jw9rInn50IbHcJcoBdYyIdRh9a2E8pi0r56Vyb3RcD3Tks5RwcVqE.', 'SESSION_HASH': 'f6f012d2bd2f4050d3a3d913db6bb4e602aec7f6', 'last_login_time': '1535985118', 'myage': '26', 'myincome': '30', 'myloc': '31%7C3101', 'mysex': 'm', 'myuid': '181103006', 'pop_avatar': '1', 'save_jy_login_name': '17521507650', 'sl_jumper': '%26cou%3D17%26omsg%3D0%26dia%3D0%26lst%3D2018-09-03', 'stadate1': '181103006', 'upt': 'dXqWdUrSFGm77AGzvxxoHQr9d8tqcuPXAcmZaIvd0wBwdvUQ1DhPu3cEKBjT1MINrf-lbMAbMRvNDz4oZz3RVaMf', 'user_attr': '000000', 'PHPSESSID': '104914b51ef6f9cd1b03ba4bc9422587', 'main_search:182103006': '%7C%7C%7C00', 'registeruid': '182103006'}

#   rs=s.get(url,headers=headers,cookies=cookies,verify=False)

#   rs.encoding='utf-8'

#   # print(rs.text)

#   # check_html(rs.text)

#   # def write_file(data):
#   with open("a.txt", 'a+') as f:
#     writer = f.write(rs.text)
#     #先写入columns_name
#   pass


# DirLogin()
