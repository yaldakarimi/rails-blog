document.addEventListener("DOMContentLoaded", () => {
    const titleInput = document.querySelector("#blog_post_title");
    const bodyInput = document.querySelector("#blog_post_body");
    const titleError = document.querySelector("#titleError");
    const bodyError = document.querySelector("#bodyError");
    
    titleInput.addEventListener("input", () => {
      if (titleInput.value !== "") {
        titleError.style.display = "none";
      }
    });
    
    bodyInput.addEventListener("input", () => {
      if (bodyInput.value !== "") {
        bodyError.style.display = "none";
      }
    });
  });