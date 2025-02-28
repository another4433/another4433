const form = document.getElementById("theForm");
const account = document.getElementById("theUser");
const quiz = document.getElementById("questions");
const logout = document.getElementById("logout");
form.addEventListener('mouseover', () => {
    console.warn("Form button have been hovered.");
    form.style.background = "white";
    form.style.text = "white";
    form.removeEventListener();
});
account.addEventListener('mouseover', () => {
    console.warn("Account button have been hovered.");
    account.style.background = "white";
    account.style.text = "white";
    account.removeEventListener();
});
quiz.addEventListener('mouseover', () => {
    console.warn("Quiz button have been hovered.");
    quiz.style.background = "white";
    quiz.style.text = "white";
    quiz.removeEventListener();
});
quiz.addEventListener('click', () => {
    console.warn("Logout button have been clicked.");
    console.time();
    document.getElementById("formBody555").innerHTML = `
        <h3 align="center">Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, View Account-->
            <button id="questions">Quiz</button> <!--Answer Form-->
            <button id="logout">Logout</button> <!--Logout-->
        </nav><br>
        <div class="container">
            <form action="main1.php" method="get">
                <label for="quizzing">Do you want to start the quiz? </label><br>
                <input type="radio" name="quizzing" id="pQuizzing1" value="Yes">Yes &nbsp;&nbsp; 
                <input type="radio" name="quizzing" id="pQuizzing2" value="No">No
                <br><input type="submit" name="submit" id="pSubmit333" value="Confirm">
            </form>
        <div><br>
    `;
});
logout.addEventListener('mouseover', () => {
    console.warn("Logout button have been hovered.");
    logout.style.background = "white";
    logout.style.text = "white";
    logout.removeEventListener();
});
logout.addEventListener('click', () => {
    console.warn("Logout button have been clicked.");
    console.time();
    document.getElementById("formBody555").innerHTML = `
        <h3 align="center">Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, View Account-->
            <button id="questions">Quiz</button> <!--Answer Form-->
            <button id="logout">Logout</button> <!--Logout-->
        </nav><br>
        <div class="container">
            <form action="main1.php" method="get">
                <label for="quitting">Are you sure that you want to logout? </label><br>
                <input type="radio" name="quitting" id="pQuitting1" value="Yes">Yes &nbsp;&nbsp; 
                <input type="radio" name="quitting" id="pQuitting2" value="No">No
                <br><input type="submit" name="submit" id="pSubmit3" value="Confirm">
            </form>
        <div><br>
    `;
});
form.addEventListener('click', () => {
    console.warn("Form button have been clicked.");
    console.time();
    document.getElementById("formBody555").innerHTML = `
        <h3 align="center">Choose an option below to start action in this website:</h3><br>
        <nav class="container">
            <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
            <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, View Account-->
            <button id="questions">Quiz</button> <!--Answer Form-->
            <button id="logout">Logout</button> <!--Logout-->
        </nav><br>
        <div class="container">
            <form action="main.php" method="get">
                <label for="forming">Choose option below to take action about the form: </label>
                <br><input type="radio" name="forming" id="pForming1" value="Create Form">Create a form
                <br><input type="radio" name="forming" id="pForming2" value="Delete Form">Delete a form
                <br><input type="radio" name="forming" id="pForming3" value="Edit Form">Edit a form
                <br><input type="radio" name="forming" id="pForming4" value="Show Form">Show all forms
                <br><input type="radio" name="forming" id="pForming5" value="Cancel">Cancel action
                <br><input type="submit" name="submit" id="pSubmit3" value="Confirm">
            </form>
        <div><br>
    `;
});
account.addEventListener('click', () => {
    console.warn("Account button have been clicked.");
    console.time();
    document.getElementById("formBody555").innerHTML = `
            <h3 align="center">Choose an option below to start action in this website:</h3><br>
            <nav class="container">
                <button id="theForm">Form</button>&nbsp;&nbsp; <!--Create Form, Edit Form, Delete Form, Show Form-->
                <button id="theUser">Account</button>&nbsp;&nbsp; <!--Edit Account, Delete Account, View Account-->
                <button id="questions">Quiz</button> <!--Answer Form-->
                <button id="logout">Logout</button> <!--Logout-->
            </nav><br>
            <div class="container">
                <form action="main.php" method="get">
                    <label for="userAction">Choose an option below to start the action: </label>
                    <br><input type="radio" name="userAction" id="pUserAction1" value="Delete User">Delete an account
                    <br><input type="radio" name="userAction" id="pUserAction2" value="Edit User">Edit an account
                    <br><input type="radio" name="userAction" id="pUserAction3" value="Logout">Logout
                    <br><input type="radio" name="userAction" id="pUserAction4" value="Cancel">Cancel action
                    <br><input type="submit" name="submit" id="pSubmit5" value="Confirm">
                </form>
            </div><br>
    `;
});