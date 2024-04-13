import telebot
from urllib.request import urlopen 
import json 

bot = telebot.TeleBot('6957224797:AAHPWPr-dEB3tS7krK17AddWvc1Q-YRkh9g')

@bot.message_handler(content_types=['text'])

def get_text_messages(message):
    if message.text == "/start":
         bot.send_message(message.from_user.id, "Iltimos telefon raqamingizni kiriting. Misol uchun: 906354433")
    else:
        url = "http://eotm.buxiu.uz/srevis1.asp?tel=" + message.text
        response = urlopen(url) 
        data_json = json.loads(response.read())
        fio = data_json['service1']['FIO']
        fio1 = 'Hurmatli talaba:' + fio.replace('&nbsp;',' ')
        bot.send_message(message.from_user.id, fio1)
        bot.send_message(message.from_user.id, data_json['service1']['MESSAGE'])


bot.polling(none_stop=True, interval=0)