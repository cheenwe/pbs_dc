# Python 爬虫入门-进阶

1. Selenium2+python 浏览器操作
2. BeautifulSoup
3. 多线程
4. 代理 ip
5. 爬取资源分析  电脑端，手机端
 

## 爬虫环境
    sudo apt-get install python3-pip
    pip3 install  bs4 pyquery tomorrow

    # pip install --upgrade pip
    # sudo chmod -R 777 /usr/local/lib/python3.5/


## 代理服务器
    sudo apt-get install python-pip python-dev
    git clone https://github.com/qiyeboy/IPProxyPool.git
    cd IPProxyPool
    apt-get install sqlite3 python-lxml 
    pip install requests chardet web.py sqlalchemy gevent psutil 


## Selenium2+python

Selenium2+python自动化45-18种定位方法（find_elements）
 
一、十八种定位方法

前八种是大家都熟悉的，经常会用到的

1.id定位：find_element_by_id(self, id_)
2.name定位：find_element_by_name(self, name)
3.class定位：find_element_by_class_name(self, name)
4.tag定位：find_element_by_tag_name(self, name)
5.link定位：find_element_by_link_text(self, link_text)
6.partial_link定位find_element_by_partial_link_text(self, link_text)
7.xpath定位：find_element_by_xpath(self, xpath)
8.css定位：find_element_by_css_selector(self, css_selector）

这八种是复数形式
9.id复数定位find_elements_by_id(self, id_)
10.name复数定位find_elements_by_name(self, name)
11.class复数定位find_elements_by_class_name(self, name)
12.tag复数定位find_elements_by_tag_name(self, name)
13.link复数定位find_elements_by_link_text(self, text)
14.partial_link复数定位find_elements_by_partial_link_text(self, link_text)
15.xpath复数定位find_elements_by_xpath(self, xpath)
16.css复数定位find_elements_by_css_selector(self, css_selector

这两种就是快失传了的
find_element(self, by='id', value=None)
find_elements(self, by='id', value=None)


二、element和elements傻傻分不清

1.element方法定位到是是单数，是直接定位到元素

2.elements方法是复数，这个学过英文的都知道，定位到的是一组元素，返回的是list队列

3.可以用type()函数查看数据类型

 


## BeautifulSoup库函数find_all()

1、name参数

sb = soup.find_all('img’)


2、keyword参数

soup.find_all(id='link2')  # [<a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>]

soup.find_all(href=re.compile("elsie")) # [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>]

这里的true指的就是选中所有有id这个属性的标签；

soup.find_all(id=True)

当然可以设置多个筛选的属性；

soup.find_all(href=re.compile("elsie"), id='link1')
# [<a class="sister" href="http://example.com/elsie" id="link1">three</a>]
还有有些属性在搜索时就不能使用，就比如HTML5中的 data-* 属性，咋办？
但是可以通过 find_all() 方法的 attrs 参数定义一个字典参数来搜索包含特殊属性的tag:

data_soup.find_all(attrs={"data-foo": "value"})
# [<div data-foo="value">foo!</div>]


通过标签名和属性名一起用：

soup.find_all("a", class_="sister")
# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
#  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]



除此之外呢，还有就是class_ 参数同样接受不同类型的 过滤器 ,字符串,正则表达式,方法或 True :当然，上面的属性也可以和标签名结合起来使用；

soup.find_all(class_=re.compile("itl"))
# [<p class="title"><b>The Dormouse's story</b></p>]

def has_six_characters(css_class):
    return css_class is not None and len(css_class) == 6

soup.find_all(class_=has_six_characters) 
#这里的这个函数，其实就是一个布尔值True；
# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
#  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
sting参数

通过 string 参数可以搜搜文档中的字符串内容.与 name 参数的可选值一样, string 参数接受 字符串 , 正则表达式 , 列表, True;

soup.find_all("a", string="Elsie")
# [<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>]

limit参数

这个参数其实就是控制我们获取数据的数量，效果和SQL语句中的limit一样；

soup.find_all("a", limit=2)
# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>]

recursive参数

调用tag的 find_all() 方法时,Beautiful Soup会检索当前tag的所有子孙节点,如果只想搜索tag的直接子节点,可以使用参数 recursive=False; 
Html

<html>
 <head>
  <title>
   The Dormouse's story
  </title>
 </head>
...

##  其他

### 解决pip install 时locale.Error: unsupported locale setting
