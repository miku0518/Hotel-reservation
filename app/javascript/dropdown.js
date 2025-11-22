document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("dropdownToggle");
  const menu = document.getElementById("dropdownMenu");
  if (!toggle || !menu) return;

  toggle.addEventListener("click", () => {
    menu.classList.toggle("show");
  });

  document.addEventListener("click", (e) => {
    if (!toggle.contains(e.target) && !menu.contains(e.target)) {
      menu.classList.remove("show");
    }
  });
});
