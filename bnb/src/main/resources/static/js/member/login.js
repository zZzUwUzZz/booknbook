function validateLoginForm() {
    let username = document.getElementById("m_id").value;
    let password = document.getElementById("m_pw").value;

    if (username === "" || password === "") {
      alert("아이디와 비밀번호를 모두 입력해주세요.");
      return false;
    }
    return true;
  }
