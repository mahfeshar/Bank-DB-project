from flask import Flask, request, render_template
import pyodbc


# Retrieve the form data and insert it into the database
def add_account(cursor, conn, AccType, AccBalance, BID, CusPhone, CusName, CusAddress, CusEmail):
    query = \
        f'''INSERT INTO Account (AccType, AccBalance, BID, CusPhone, CusName, CusAddress, CusEmail)
            VALUES ('{AccType}', {AccBalance}, {BID}, '{CusPhone}', '{CusName}', '{CusAddress}', '{CusEmail}')'''
    cursor.execute(query)
    conn.commit()


# Retrieve the search name and perform a search in the database
def search_account(cursor, keyword):
    query = \
        f'''SELECT A.AccNumber, A.CusName, A.AccBalance, A.AccType, A.CusPhone, A.CusAddress, A.CusEmail, B.BName
            FROM Account As A Join Branch AS B ON B.BID = A.BID
            WHERE CusName LIKE '%{keyword}%'
        '''
    cursor.execute(query)
    results = cursor.fetchall()
    return results

def transfer_money(cursor, conn,Amount, FromAcc, ToAcc):
    query = \
        f'''BEGIN TRANSACTION;
            UPDATE Account
            SET AccBalance = AccBalance - {Amount}
            WHERE AccNumber = {FromAcc};

            UPDATE Account
            SET AccBalance = AccBalance + {Amount}
            WHERE AccNumber = {ToAcc};

            INSERT INTO Trans (Date, To_ID, Amount, AccNumber)
            VALUES (GETDATE(), {ToAcc}, {Amount}, {FromAcc});
            COMMIT;
        '''
    cursor.execute(query)
    conn.commit()

def account_history(cursor, AffectedID):
    query = \
        f'''SELECT HID, Action, Date, OldBalance, NewBalance
            FROM AccountHistory
            WHERE AffectedID = {AffectedID}
        '''
    cursor.execute(query)
    results = cursor.fetchall()
    return results


app = Flask(__name__)

# Establish a connection to the SQL Server
DRIVER_NAME = 'SQL Server'
SERVER_NAME = 'CORNPOP'
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=CORNPOP;'
                      'Database=Bank;'
                      'Trusted_Connection=yes;')

# Create a cursor object to execute SQL queries
cursor = conn.cursor()

@app.route('/')
# @app.route('/<path:any>')
def index():
    return render_template('/')


@app.route('/submit_newAccount', methods=['POST'])
def submit_account():
    if request.method == 'POST':
        AccType = request.form['AccType']
        AccBalance = request.form['AccBalance']
        BID = request.form['BID']
        CusPhone = request.form['CusPhone']
        CusName = request.form['CusName']
        CusAddress = request.form['CusAddress']
        CusEmail = request.form['CusEmail']

        add_account(cursor, conn, AccType, AccBalance, BID, CusPhone, CusName, CusAddress, CusEmail)
        return render_template('index.html')

@app.route('/search_accounts', methods=['GET'])
def search_accounts():
    if request.method == 'GET':
        keyword = request.args.get('searchName')
        results = search_account(cursor, keyword)
        return render_template('AccountInfo.html', search_results=results)

@app.route('/transfer_money', methods=['POST'])
def transferM():
    if request.method == 'POST':
        Amount = request.form['Amount']
        FromAcc = request.form['FromAcc']
        ToAcc = request.form['ToAcc']
        transfer_money(cursor, conn, Amount, FromAcc, ToAcc)
        return render_template('index.html')

@app.route('/accounts_history', methods=['GET'])
def history():
    if request.method == 'GET':
        AffectedID = request.args.get('AffectedID')
        results = account_history(cursor, AffectedID)
        return render_template('AccountHistory.html', search_history=results)

app.run(debug=True)
if __name__ == '__main__':
    app.run(debug=True)

# Close the cursor and connection
cursor.close()
conn.close()