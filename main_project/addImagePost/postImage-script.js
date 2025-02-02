document.getElementById('uploadForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const form = e.target;
    const formData = new FormData(form);
    const progressContainer = document.getElementById('progressContainer');
    const progressBar = document.getElementById('progressBar');
    const progressText = document.getElementById('progressText');
    const status = document.getElementById('status');

    // Show progress container
    progressContainer.style.display = 'block';

    const xhr = new XMLHttpRequest();

    // Update progress
    xhr.upload.addEventListener('progress', function (e) {
        if (e.lengthComputable) {
            const percentComplete = Math.round((e.loaded / e.total) * 100);
            progressBar.value = percentComplete;
            progressText.textContent = `${percentComplete}%`;
        }
    });

    // Handle response
    xhr.onload = function () {
        if (xhr.status === 200) {
            status.innerHTML = `<p style="color: green;">${xhr.responseText}</p>`;
            window.location.href="../welcome.html";
        } else {
            status.innerHTML = `<p style="color: red;">Failed to upload. Please try again.</p>`;
        }

        // Reset progress bar
        progressBar.value = 0;
        progressText.textContent = '0%';
        progressContainer.style.display = 'none';
    };

    // Handle errors
    xhr.onerror = function () {
        status.innerHTML = `<p style="color: red;">An error occurred during upload.</p>`;
    };

    xhr.open('POST', 'upload-image.php');
    xhr.send(formData);
});
e5y