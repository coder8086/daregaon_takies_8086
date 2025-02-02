document.getElementById("loginForm").addEventListener("submit", async function (e) {
    e.preventDefault();

    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    const response = await fetch("validate.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`,
    });

    const result = await response.json();
    const message = document.getElementById("message");

    if (result.mystatus === "success") {
        message.style.color = "green";
        message.textContent = result.message;
        setTimeout(() => {
            window.location.href = "../welcome.html"; // Redirect to another page if needed
        }, 1000);
    } else {
        message.style.color = "red";
        message.textContent = result.message;
    }
});
