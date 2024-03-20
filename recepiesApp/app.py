from flask import Flask, render_template

app = Flask(__name__)

@app.route('/recepies/food')
def tab1():
    return render_template('food.html')

@app.route('/recepies/dessert')
def tab2():
    return render_template('dessert.html')

@app.route('/recepies/drink')
def tab3():
    return render_template('drink.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
