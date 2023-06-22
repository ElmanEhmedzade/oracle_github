import tkinter as tk
import cx_Oracle

root = None  # Ana pencereyi global olarak tanımladık

def save_registration():
    first_name = entry_first_name.get()
    last_name = entry_last_name.get()
    email = entry_email.get()
    password = entry_password.get()

    # Oracle veritabanına bağlanma
    connection = cx_Oracle.connect("ELMAN", "ELMAN", "localhost:1521/PERFECT")
    cursor = connection.cursor()

    # INSERT işlemi
    query = "INSERT INTO USER_REG (USER_NAME, USER_LAST_NAME, USER_EMAIL, USER_PASSWORD) VALUES (:1, :2, :3, :4)"
    cursor.execute(query, (first_name, last_name, email, password))
    connection.commit()

    # Veritabanı bağlantısını kapatma
    cursor.close()
    connection.close()

    # Kullanıcı giriş sayfasını açma
    open_login_page()       

def login():
    username = entry_username.get()
    password = entry_password.get()

    # Oracle veritabanına bağlanma
    connection = cx_Oracle.connect("ELMAN", "ELMAN", "localhost:1521/PERFECT")
    cursor = connection.cursor()

    # Kullanıcıyı veritabanında kontrol etme
    query = "SELECT COUNT(*) FROM USER_REG WHERE USER_NAME = :1 AND USER_PASSWORD = :2"
    cursor.execute(query, (username, password))
    result = cursor.fetchone()

    if result[0] > 0:
        # Kullanıcı veritabanında varsa yemekleri gösterme
        open_menu_page()
    else:
        # Hatalı giriş mesajını görüntüleme
        label_message.config(text="Hatalı kullanıcı adı veya şifre")

    # Veritabanı bağlantısını kapatma
    cursor.close()
    connection.close()

def open_registration_page():
    global entry_first_name, entry_last_name, entry_email, entry_password, root

    # Ana pencereyi kontrol etme ve varsa yok etme
    if root is not None:
        root.destroy()

    root = tk.Tk()
    root.title("Kayıt Formu")

    # Ad etiketi ve giriş alanı
    label_first_name = tk.Label(root, text="Ad:")
    label_first_name.pack()
    entry_first_name = tk.Entry(root)
    entry_first_name.pack()

    # Soyad etiketi ve giriş alanı
    label_last_name = tk.Label(root, text="Soyad:")
    label_last_name.pack()
    entry_last_name = tk.Entry(root)
    entry_last_name.pack()

    # E-posta etiketi ve giriş alanı
    label_email = tk.Label(root, text="E-posta:")
    label_email.pack()
    entry_email = tk.Entry(root)
    entry_email.pack()

    # Şifre etiketi ve giriş alanı
    label_password = tk.Label(root, text="Şifre:")
    label_password.pack()
    entry_password = tk.Entry(root, show="*")
    entry_password.pack()

    # Kaydet düğmesi
    button_save = tk.Button(root, text="Kaydet", command=save_registration)
    button_save.pack()

    root.mainloop()

def open_login_page():
    global entry_username, entry_password, label_message, root

    # Ana pencereyi kontrol etme ve varsa yok etme
    if root is not None:
        root.destroy()

    root = tk.Tk()
    root.title("Giriş Yap")

    # Kullanıcı adı etiketi ve giriş alanı
    label_username = tk.Label(root, text="Kullanıcı Adı:")
    label_username.pack()
    entry_username = tk.Entry(root)
    entry_username.pack()

    # Şifre etiketi ve giriş alanı
    label_password = tk.Label(root, text="Şifre:")
    label_password.pack()
    entry_password = tk.Entry(root, show="*")
    entry_password.pack()

    # Giriş düğmesi
    button_login = tk.Button(root, text="Giriş", command=login)
    button_login.pack()

    # Hata mesajı etiketi
    label_message = tk.Label(root, text="")
    label_message.pack()

    root.mainloop()

def open_menu_page():
    global menu_window

    # Ana pencereyi kontrol etme ve varsa yok etme
    if root is not None:
        root.destroy()

    menu_window = tk.Tk()
    menu_window.title("Yemekler")

    # Veritabanına bağlanma
    connection = cx_Oracle.connect("ELMAN", "ELMAN", "localhost:1521/PERFECT")
    cursor = connection.cursor()

    # Yemekleri veritabanından getirme
    query = "SELECT ad, qiymet FROM yemekler"
    cursor.execute(query)
    results = cursor.fetchall()

    # Tablo bileşenini oluşturma
    table = ttk.Treeview(menu_window, columns=("Ad", "Fiyat"))
    table.heading("#0", text="Sıra")
    table.heading("Ad", text="Yemek Adı")
    table.heading("Fiyat", text="QIYMET")
    table.column("#0", width=50, anchor="center")
    table.column("Ad", width=200)
    table.column("Fiyat", width=100, anchor="center")

    # Verileri tabloya ekleme
    for i, result in enumerate(results, start=1):
        table.insert("", "end", text=i, values=(result[0], result[1]))

    table.pack()

    # Veritabanı bağlantısını kapatma
    cursor.close()
    connection.close()

    menu_window.mainloop()

# Ana uygulama penceresi
root = tk.Tk()
root.title("Uygulama")
root.geometry("500x400")

# Kayıt Ol düğmesi
button_register = tk.Button(root, text="Kayıt Ol", command=open_registration_page)
button_register.pack()

# Giriş Yap düğmesi
button_login = tk.Button(root, text="Giriş Yap", command=open_login_page)
button_login.pack()

root.mainloop()
