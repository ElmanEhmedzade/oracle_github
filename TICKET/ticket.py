import tkinter as tk
from tkinter import messagebox
import cx_Oracle

def mesaj(text):
    messagebox.showinfo(text, 'son')

def save_d():
    connection = cx_Oracle.connect("@localhost:1521/")  #BURA OZ BAGLANTINI YAZ
    cursor = connection.cursor()
    sql = 'BEGIN upd_place(:1, :2, :3); END;'
    cursor.execute(sql, (Eadi.get(),Eid.get() ,Esay.get()))   #user_id_yz IN NUMBER, PL_ID_YZ IN NUMBER, PASS_NUM_Y IN NUMBER
    connection.commit()
    cursor.close()
    connection.close()
    mesaj('tamamlandi')

top = tk.Tk()
top.geometry('800x600')

Ladi = tk.Label(top, text="id")
Ladi.place(x=10, y=10)
Eadi = tk.Entry(top, bd=2)
Eadi.place(x=100, y=10)

Lid = tk.Label(top, text="yer")
Lid.place(x=10, y=40)
Eid = tk.Entry(top, bd=2)
Eid.place(x=100, y=40)

Lsay = tk.Label(top, text="numb")
Lsay.place(x=10, y=70)
Esay = tk.Entry(top, bd=2)
Esay.place(x=100, y=70)

save = tk.Button(top, text='save', command=save_d)
save.place(x=150, y=100)

top.mainloop()
