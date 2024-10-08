from flask import Flask, render_template, request, redirect, url_for
import qrcode
import os
from datetime import datetime

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'uploads/'
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

# Assume this is the amount due for the tenant
amount_due = 1000  # Replace with actual logic to retrieve amount due

@app.route('/')
def index():
    # Generate QR Code
    qr_data = "gcash_payment_info"  # Replace with actual GCash payment info
    qr_img = qrcode.make(qr_data)
    qr_path = os.path.join(app.config['UPLOAD_FOLDER'], 'gcash_qr.png')
    qr_img.save(qr_path)
    return render_template('index.html', amount_due=amount_due, qr_path=qr_path)

@app.route('/upload', methods=['POST'])
def upload():
    if 'receipt' not in request.files:
        return 'No file part'
    
    file = request.files['receipt']
    reference_number = request.form['reference_number']

    if file.filename == '':
        return 'No selected file'

    if file:
        filename = f"{datetime.now().strftime('%Y%m%d%H%M%S')}_{file.filename}"
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        # Here, you would save the reference_number and file info to the database
        # ...

        return redirect(url_for('success'))

@app.route('/success')
def success():
    return "Payment received and receipt uploaded successfully!"

if __name__ == '__main__':
    app.run(debug=True, port=5001)