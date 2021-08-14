from os import close
from flask import Flask, render_template,flash
from flask import request,session
import json
from werkzeug.utils import redirect,secure_filename
from flask_mysqldb import MySQL
import psycopg2
import popularity_model as pop
import random

con = psycopg2.connect(database="d7kuslrveqbabl", user="lyawunaedvwsuv", password="29f7357bdc32e4f28a0b5a3bb6e629e60a672805e7ea7dbaac586ddbae722fbc", host="ec2-44-195-209-130.compute-1.amazonaws.com", port="5432")

with open('config.json', 'r') as c:
    params = json.load(c)["params"]
app = Flask(__name__)
app.secret_key ="pakcitizen"


def get_posts():
    cur = con.cursor()
    cur.execute("SELECT * FROM post	LEFT JOIN category ON post.postcategory=category.categoryID LEFT JOIN _user ON post.postAuthor=_user.userID ORDER BY post.postID DESC;")
    posts = cur.fetchall()
    cur.close()
    return(posts)
def get_news(newsid):
    cur = con.cursor()
    cur.execute("SELECT * FROM post LEFT JOIN category ON post.postcategory=category.categoryID LEFT JOIN _USER ON post.postAuthor=_user.userid where postid=%s",[newsid])
    posts = cur.fetchall()
    cur.close()
    return(posts)
def categories():
    cur = con.cursor()
    cur.execute("SELECT  * FROM category;")
    cate=cur.fetchall()
    return(cate)
def _users():
    cur = con.cursor()
    cur.execute("SELECT  * FROM _user;")
    users=cur.fetchall()
    return(users)
def category_Image(id):
    cur = con.cursor()
    cur.execute("SELECT  catimage FROM category WHERE categoryid=%s",[id])
    cate=cur.fetchall()
    return(cate)
def get_news_by_category(cat_id):
    cur = con.cursor()
    cur.execute("SELECT * FROM post LEFT JOIN category ON post.postcategory=category.categoryID LEFT JOIN _user ON post.postAuthor=_user.userID where postcategory=%s ORDER BY post.postID DESC",[cat_id])
    posts = cur.fetchall()
    cur.close()
    return(posts)
def search(term):
    cur = con.cursor()
    cari = "%" + term +"%"
    cur.execute("SELECT * FROM post LEFT JOIN category ON post.postcategory=category.categoryID LEFT JOIN _USER ON post.postAuthor=_user.userid WHERE post.posttitle LIKE %s or post.postdescription LIKE %s ORDER BY postID DESC ",(cari,cari))
    posts = cur.fetchall()
    cur.close()
    return(posts)
#update_functions
def category_details(id):
    cur=con.cursor()
    cur.execute('SELECT * FROM category WHERE categoryid=%s',[id])
    data=cur.fetchall()
    cur.close()
    return(data)
def update_category(id,name):
    cur=con.cursor()
    cur.execute('UPDATE category SET categoryname=%s WHERE categoryid=%s',[name,id])
    cur.close()
    return()
def add_category_function(name):
    cur=con.cursor()
    r=random.randint(1,2000)
    cur.execute("INSERT INTO category(categoryid,categoryname,categoryposts,catimage) VALUES (%s,%s,%s,%s)",[r,name,'0','global.jpg'])
    cur.close()
    return()

def user_details(id):
    cur=con.cursor()
    cur.execute('SELECT * FROM _user WHERE userid=%s',[id])
    data=cur.fetchall()
    cur.close()
    return(data)
def update_user(id,fname,lname,user):
    cur=con.cursor()
    cur.execute('UPDATE _user SET firstname=%s, lastname=%s, username=%s WHERE userid=%s',[fname,lname,user,id])
    cur.close()
    return()
def add_user_function(fname,lname,username,passwrd,role):
    cur=con.cursor()
    r=random.randint(1,2000)
    cur.execute("INSERT INTO _user(userid,firstname,lastname,username,userpassword,userrole) VALUES (%s,%s,%s,%s,%s,%s)",[r,fname,lname,username,passwrd,role])
    cur.close()
    return()
def update_post(id,title,des):
    cur=con.cursor()
    cur.execute('UPDATE post SET postTitle=%s, postDescription=%s WHERE postid=%s',[title,des,id])
    cur.close()
    return()
from datetime import date
# /.////////////
def add_post_function(title,des,cat,slider,image):
    cur=con.cursor()
    iddd=0
    r=random.randint(1,2000)
    today = date.today()
    date1=today.strftime("%d/%m/%Y")
    cur.execute("INSERT INTO post(postid,postTitle,postDescription,postImage,slider,postDate,postCategory,postAuthor) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",[r,title,des,image,slider,date1,cat,session['id']])
    cur.close()
    return()
@app.route('/')
def Home():
    category=categories()
    posts=get_posts()
    return render_template('index.html',params=params,category=category,posts=posts)

@app.route('/apply',)
def Apply():
    cate=categories()
    return render_template('apply.html',params=params,category=cate)

@app.route('/about')
def About():
    cate=categories()
    return render_template('about.html',params=params,category=cate)

@app.route('/contact')
def contact():
    cate=categories()
    return render_template('Contact.html',params=params,category=cate)


@app.route('/news/<post_slug>')
def News_route(post_slug):
    category=categories()
    news=get_news(post_slug)
    posts=get_posts()
    return render_template('News.html',posts=posts,params=params,category=category,news=news)

@app.route('/category/<post_slug>')
def category(post_slug):
    category=categories()
    posts=get_news_by_category(post_slug)
    catimage=category_Image(post_slug)
    return render_template('category.html',catimage=catimage,params=params,category=category,posts=posts)

@app.route('/search',methods=['POST'])
def search_route():
    Term= request.form['search']
    category=categories()
    results=search(Term)
    posts=get_posts()
    return render_template('search.html',posts=posts,results=results,params=params,category=category,search_term=Term)


# Admin
@app.route('/admin/')
def admin_login():
    return render_template('admin/index.html')

@app.route('/login',methods=['POST','GET'])
def login():
    user=request.form['username']
    password=request.form['password']
    cur=con.cursor()
    cur.execute("select * from _user where userpassword=%s AND username=%s",[password,user])
    temp = cur.fetchall()     
    cur.close()
    if temp==[]:
        error="username and Password not matched"
        return render_template('admin/index.html',error=error)
    else:
        session['logged_in'] = True
        session['role']=temp[0][5]
        session['id']=temp[0][0]
        session['user'] =user
        return redirect('/home')
# admin posts
@app.route('/home')
def home():
    if session.get('logged_in') == True:
        posts=get_posts()
        return render_template('admin/home.html',posts=posts)
    else:
        return render_template('admin/index.html')

@app.route('/add_post')
def add_post():
    category=categories()
    return render_template('admin/add-post.html',cate=category)

def update_category_posts(cat):
    cur=con.cursor()
    cur.execute('SELECT categoryposts FROM category WHERE categoryid=%s',[cat])
    number=cur.fetchall()
    cur.close()
    return number

def update_category_posts2(cat,number):
    cur=con.cursor()
    cur.execute('UPDATE category SET categoryposts=%s WHERE categoryid=%s',[number,cat])
    cur.close()
    return number

@app.route('/add_post_save',methods=['POST'])
def add_post_save():
    title=request.form['post_title']
    postdesc=request.form['postdesc']
    category=request.form['category']
    slid=request.files['slider'].filename
    file2=request.files['file'].filename
    add_post_function(title,postdesc,category,slid,file2)
    number=update_category_posts(category)
    no=number[0][0]
    update_category_posts2(category,no+1)
    return redirect('/home')

@app.route('/update-post/<post_slug>/<cat>')
def updatepost(post_slug,cat):
    news=get_news(post_slug)
    return render_template('admin/update-post.html',news=news)

@app.route('/update_post_save',methods=['POST'])
def update_post_save():
    id=request.form['post_id']
    title=request.form['post_title']
    postdesc=request.form['postdesc']
    update_post(id,title,postdesc)
    return redirect('/home')

@app.route('/delete-post/<post_slug>/<cat>')
def postdelete(post_slug,cat):
    cur=con.cursor()
    cur.execute('DELETE FROM post WHERE postid=%s',[post_slug])
    cur.close()
    number=update_category_posts(cat)
    no=number[0][0]
    update_category_posts2(cat,no-1)
    return redirect('/home')

# ////// admin posts end

# /////////// admin user
@app.route('/admin_users')
def admin_users():
    users=_users()
    return render_template('admin/users.html',users=users)

@app.route('/add_user')
def add_user():
    return render_template('admin/add-user.html')

@app.route('/add_user_save',methods=['POST'])
def add_user_save():
    fname=request.form['fname']
    lname=request.form['lname']
    username=request.form['username']
    password=request.form['password']
    role=request.form['role']
    add_user_function(fname,lname,username,password,role)
    return redirect('admin_users')

@app.route('/update-user/<post_slug>')
def updateuser(post_slug):
    cate=user_details(post_slug)
    return render_template('admin/update-user.html',user=cate)

@app.route('/user_update_save',methods=['POST'])
def update_user_save():
    id=request.form['id']
    fname=request.form['fname']
    lname=request.form['lname']
    user=request.form['username']
    update_user(id,fname,lname,user)
    return redirect('admin_users')


    
@app.route('/delete-user/<post_slug>')
def userdelete(post_slug):
    cur=con.cursor()
    cur.execute('DELETE FROM _user WHERE userid=%s',[post_slug])
    cur.close()
    return redirect('/admin_users')

# //////
@app.route('/admin_category')
def admin_category():
    if session.get('logged_in') == True:
        category=categories()
        return render_template('admin/category.html',category=category)
    else:
        return render_template('admin/index.html')
@app.route('/update-category/<post_slug>')
def categorydetails(post_slug):
    cate=category_details(post_slug)
    return render_template('admin/update-category.html',category=cate)

@app.route('/category_update_save',methods=['POST'])
def update_category_save():
    id=request.form['cat_id']
    name=request.form['cat_name']
    update_category(id,name)
    return redirect('admin_category')
@app.route('/add_category')
def add_category():
    return render_template('admin/add-category.html')
@app.route('/add_category_save',methods=['POST'])
def add_category_save():
    name=request.form['cat']
    add_category_function(name)
    return redirect('admin_category')
    
@app.route('/delete-category/<post_slug>')
def categorydelete(post_slug):
    cur=con.cursor()
    cur.execute('DELETE FROM category WHERE categoryid=%s',[post_slug])
    cur.close()
    return redirect('/admin_category')





@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    session.pop('role', None)
    session.pop('user', None)
    return render_template('admin/index.html')

if __name__ == '__main__':
   app.run(debug=True)
