import cx_Oracle
import datetime
import requests
import xml.etree.ElementTree as ET
import schedule
import time

def update_tcmb_exchange_rates():
    url = "https://www.tcmb.gov.tr/kurlar/today.xml"
    response = requests.get(url)
    xml_content = response.content
    root = ET.fromstring(xml_content)

    header = ["Currency Code", "Forex Buying", "Forex Selling"]
    data = []

    for currency in root.iter('Currency'):
        currency_data = [
            currency.attrib['CurrencyCode'],
            currency.find('ForexBuying').text,
            currency.find('ForexSelling').text
        ]
        data.append(currency_data)

    connection = cx_Oracle.connect("ELMAN", "ELMAN", "localhost:1521/PERFECT")
    cursor = connection.cursor()

    for row in data[:22]:
        tarih = datetime.datetime.now()
        val_ad = row[0]
        val_dey = row[2]

        cursor.execute("SELECT COUNT(*) FROM AUTO_TCMB WHERE val_ad = :val_ad", val_ad=val_ad)
        result = cursor.fetchone()

        if result[0] > 0:
            cursor.execute("UPDATE AUTO_TCMB SET val_dey = :val_dey, tarih = :tarih WHERE val_ad = :val_ad",
                           val_dey=val_dey, tarih=tarih, val_ad=val_ad)
        else:
            cursor.execute("INSERT INTO AUTO_TCMB (val_ad, val_dey, tarih) VALUES (:val_ad, :val_dey, :tarih)",
                           val_ad=val_ad, val_dey=val_dey, tarih=tarih)

    connection.commit()
    cursor.close()
    connection.close()

schedule.every().minute.do(update_tcmb_exchange_rates)

while True:
    schedule.run_pending()
    time.sleep(1)
