<?php
session_start();
Class Action {
    private $db;

    public function __construct() {
        include 'db_connect.php'; // Ensure your DB connection file is included
        $this->db = $conn;
    }

    public function login() {
        extract($_POST);

        // Ensure email and password fields are set
        if (!isset($username) || !isset($password)) {
            return "Missing credentials!";
        }

        // Hash the password (assume md5 for this example)
        $password = md5($password);

        // Query the database to check for user
        $query = $this->db->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
        $query->bind_param('ss', $username, $password);
        $query->execute();
        $result = $query->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            $_SESSION['login_id'] = $user['id']; // Set session login ID
            $_SESSION['login_type'] = $user['type']; // Assuming type column defines user role
            return 1; // Success
        } else {
            return "Invalid email or password!"; // Failure
        }
    }

    public function login2() {
        extract($_POST);

        $password = md5($password);
        $qry = $this->db->query("SELECT * FROM tenants where email = '$username' and password = '$password' and status = 1 ");
        if ($qry->num_rows > 0) {
            foreach ($qry->fetch_array() as $key => $value) {
                if (!is_numeric($key) && $key != 'password')
                    $_SESSION['login_' . $key] = $value;
            }
            $_SESSION['login_type'] = 3;
            return 1;
        } else {
            return 3;
        }
    }

    public function logout() {
        session_destroy();
        foreach ($_SESSION as $key => $value) {
            unset($_SESSION[$key]);
        }
        return 1;
    }

    public function logout2() {
        session_destroy();
        foreach ($_SESSION as $key => $value) {
            unset($_SESSION[$key]);
        }
        return 1;
    }

    public function save_user() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", username = '$username' ";
        if (!empty($password))
            $data .= ", password = '" . md5($password) . "' ";
        $data .= ", type = '$type' ";
        if (empty($id)) {
            $save = $this->db->query("INSERT INTO users set $data");
        } else {
            $save = $this->db->query("UPDATE users set $data where id = $id");
        }
        if ($save)
            return 1;
    }

    public function delete_user() {
        extract($_POST);
        $delete = $this->db->query("DELETE FROM users where id = " . $id);
        if ($delete)
            return 1;
    }

    public function signup() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", username = '$username' ";
        $data .= ", password = '" . md5($password) . "' ";
        $save = $this->db->query("INSERT INTO users set $data");
        if ($save)
            return 1;
    }

    public function update_account() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", username = '$username' ";
        if (!empty($password))
            $data .= ", password = '" . md5($password) . "' ";
        $save = $this->db->query("UPDATE users set $data where id = {$_SESSION['login_id']}");
        if ($save)
            return 1;
    }

    public function save_settings() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", email = '$email' ";
        $data .= ", contact = '$contact' ";
        $save = $this->db->query("UPDATE system_settings set $data");
        if ($save)
            return 1;
    }

    public function save_room() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", price = '$price' ";
        $save = $this->db->query("INSERT INTO rooms set $data");
        if ($save)
            return 1;
    }

    public function delete_room() {
        extract($_POST);
        $delete = $this->db->query("DELETE FROM rooms where id = $id");
        if ($delete)
            return 1;
    }

    public function save_tenant() {
        extract($_POST);
        $data = " name = '$name' ";
        $data .= ", room_id = '$room_id' ";
        $data .= ", email = '$email' ";
        $data .= ", contact = '$contact' ";
        $save = $this->db->query("INSERT INTO tenants set $data");
        if ($save)
            return 1;
    }

    public function delete_tenant() {
        extract($_POST);
        $delete = $this->db->query("DELETE FROM tenants where id = $id");
        if ($delete)
            return 1;
    }

    public function get_tdetails() {
        extract($_POST);
        $qry = $this->db->query("SELECT * FROM tenants where id = $id");
        if ($qry->num_rows > 0) {
            return json_encode($qry->fetch_array());
        }
    }

    public function save_payment() {
        extract($_POST);
        $data = " tenant_id = '$tenant_id' ";
        $data .= ", amount = '$amount' ";
        $data .= ", date = '$date' ";
        $save = $this->db->query("INSERT INTO payments set $data");
        if ($save)
            return 1;
    }

    public function delete_payment() {
        extract($_POST);
        $delete = $this->db->query("DELETE FROM payments where id = $id");
        if ($delete)
            return 1;
    }
}
?>
