<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
</head>
<body>
    <h1>Edit Customer</h1>
    <form id="editCustomerForm">
        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" required>
        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" required>
        <label for="street">Street:</label>
        <input type="text" id="street" name="street" required>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>
        <label for="state">State:</label>
        <input type="text" id="state" name="state" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        <button type="submit">Update Customer</button>
    </form>

    <script>
            var urlParams = new URLSearchParams(window.location.search);
            var uuid = urlParams.get('uuid');

            if (!uuid) {
                alert('UUID not provided. Redirecting to the customer list page.');
                window.location.href = 'customer_list.html';
            }

            document.getElementById('editCustomerForm').addEventListener('submit', function (event) {
                event.preventDefault();
                updateCustomer();
            });

            function updateCustomer() {
                var token = 'REPLACE_WITH_BEARER_TOKEN'; // Replace with the actual bearer token received during login

                var updatedCustomer = {
                    first_name: document.getElementById('first_name').value,
                    last_name: document.getElementById('last_name').value,
                    street: document.getElementById('street').value,
                    address: document.getElementById('address').value,
                    city: document.getElementById('city').value,
                    state: document.getElementById('state').value,
                    email: document.getElementById('email').value,
                    phone: document.getElementById('phone').value,
                };

                fetch('https://qa.sunbasedata.com/sunbase/portal/api/assignment.jsp', {
                    method: 'POST',
                    headers: {
                        'Authorization': 'Bearer ' + token,
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        cmd: 'update',
                        uuid: uuid,
                        updatedCustomer: updatedCustomer,
                    }),
                })
                .then(response => {
                    if (response.ok) {
                        // Redirect to the customer list page after successful update
                        window.location.href = 'customer_list.html';
                    } else {
                        throw new Error('Failed to update customer');
                    }
                })
                .catch(error => {
                    console.error('Error updating customer:', error);
                });
            }
        </script>

        </body>
        </html>

