#! -coding:utf8 -*-
from my_download import download

# down_url = "http://t3.jyimg.com/e6/eb/bfd79be503e98ee35900cc07b0d5/146952313d.jpg"

# download(down_url, "11", "1.jpg")

with open('./shijiejiayuan.csv', 'r') as f:
  index = 0
  for line in f:
    line = line.strip('\n').split(',')
    u_num = line[0]
    u_id = line[1]
    u_url = line[2]

    u_download_folder = u_num + "_" + u_id


# download(down_url, "11", "1.jpg")
