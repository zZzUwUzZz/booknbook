 // 파일 업로드 폼 제출 이벤트
 document.getElementById('uploadForm').addEventListener('submit', function (e) {
     e.preventDefault();
     var form = document.getElementById('uploadForm');
     var formData = new FormData(form);

     fetch('/seller/settings/account', {
             method: 'POST',
             body: formData
         })
         .then(response => response.json())
         .then(data => {
             console.log(data);
             alert('File uploaded successfully'); // 업로드 완료 경고창
             form.reset(); // 폼 리셋
         })
         .catch(error => {
             console.log('Error:', error);
             alert('File upload failed'); // 업로드 실패 경고창
         });
 });

 // 초기 상태에서 업로드 버튼 비활성화
 const uploadBtn = document.getElementById('uploadBtn');
 uploadBtn.disabled = true;

 document.getElementById('fileInput').addEventListener('change', function () {
     const fileInput = document.getElementById('fileInput');
     const warning = document.getElementById('warning');
     const imagePreview = document.getElementById('imagePreview'); // 미리보기 이미지

     const file = fileInput.files[0];

     // 파일이 선택되지 않았을 경우
     if (!file) {
         warning.textContent = '';
         uploadBtn.disabled = true;
         imagePreview.src = ''; // 미리보기 이미지 리셋
         return;
     }

     // 확장자 검사
     const allowedExtensions = ['png', 'jpg', 'jpeg'];
     const extension = file.name.split('.').pop().toLowerCase();
     if (!allowedExtensions.includes(extension)) {
         warning.textContent = 'Invalid file extension!';
         fileInput.value = ''; // 파일 입력 리셋
         uploadBtn.disabled = true; // 업로드 버튼 비활성화
         imagePreview.src = ''; // 미리보기 이미지 리셋
         return;
     }

     // 파일 크기 검사 (1MB = 1024 * 1024 bytes)
     if (file.size > 1024 * 1024) {
         warning.textContent = 'File size exceeds 1MB!';
         fileInput.value = ''; // 파일 입력 리셋
         uploadBtn.disabled = true; // 업로드 버튼 비활성화
         imagePreview.src = ''; // 미리보기 이미지 리셋
         return;
     }

     // 이미지 미리보기
     const reader = new FileReader();
     reader.onload = function (e) {
         imagePreview.src = e.target.result;
     };
     reader.readAsDataURL(file);

     // 모든 조건을 만족하면 업로드 버튼 활성화
     uploadBtn.disabled = false;

     // 경고 메시지 초기화
     warning.textContent = '';
 });