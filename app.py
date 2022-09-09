from flask import Flask, render_template, url_for, redirect, request, session, flash

app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/blog_single_sidebar')
def blog_single_sidebar():
    return render_template('blog-single-sidebar.html')

@app.route('/shop_grid')
def shop_grid():
    return render_template('shop-grid.html')

@app.route('/cart')
def cart():
    return render_template('cart.html')

@app.route('/checkout')
def checkout():
    return render_template('checkout.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/mail', methods=['GET', 'POST'])
def mail():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        subject = request.form['subject']
        message = request.form['message']
        company_name = request.form['company_name']
        print(f"Your name is {name}, the subject of the message is {subject} and your email is {email} with company name {company_name}. The message is {message}.")
        return redirect(url_for('index'))
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=3000)