const selectedFiles = () => {
    const actualBtn = document.getElementById('documents_');
    const fileSelected = document.getElementById('file-selected');
    
    actualBtn.addEventListener('change', (e) => {
        let files = [];
        Array.from(e.currentTarget.files).forEach((file) => {
            files.push(file.name)
            fileSelected.textContent = files.join(", ")
            console.log(files.join(", "));
        })
    })
}

export { selectedFiles }