import cx_Oracle
import requests
from bs4 import BeautifulSoup

base_url = "https://anadolu.az/menyu/"
yemekler = ["rybnye-blyuda", "predzakaz", "hleb", "deserty", "kyababy", "pasta", "picca", "dieticheskie-blyuda", "garniry", "SahurIftarMenyu", "tureckie-blyuda", "ovoshchnye-blyuda", "muchnye-blyuda", "breakfast", "evropeyskie-blyuda", "doner", "zavtrak", "sandwich", "pide", "prohladitelnye-napitki", "lahmadzhun", "supy", "svezhevyzhatye-soki", "salaty", "holodnye-zakuski", "kombo-menyu", "azerbaydzhanskie-blyuda"]

name_list = []
price_list = []
category_list = []

for yemek in yemekler:
    yemek_url = yemek.replace(" ", "-")
    url = base_url + yemek_url

    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")

    names = soup.find_all(class_='name')
    prices = soup.find_all(class_='price-new')

    category = url.split("/")[-1]  
    category_list.extend([category] * len(names))  

    for name in names:
        name_list.append(name.text[:100])  

    for price in prices:
        price_cleaned = price.text.replace(" AZN", "").replace(",", "")  
        price_list.append(price_cleaned)


connection = cx_Oracle.connect("ELMAN", "ELMAN", "localhost:1521/PERFECT")
cursor = connection.cursor()

for i in range(len(name_list)):
    name = name_list[i]
    price = float(price_list[i])  
    category = category_list[i]

    insert_query = "INSERT INTO yemekler (ad, qiymet, kateqoriya) VALUES (:name, :price, :category)"
    values = {'name': name, 'price': price, 'category': category}
    cursor.execute(insert_query, values)

connection.commit()

cursor.close()
connection.close()
