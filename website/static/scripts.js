function toggleNoteExpand(noteElement) {
    // Get all note elements
    const notes = document.querySelectorAll('.note');
    
    // Collapse all notes except the clicked one
    notes.forEach(note => {
        if (note !== noteElement) {
            note.classList.remove('expanded');
            note.classList.add('collapsed');
        }
    });
    
    // Toggle the clicked note
    noteElement.classList.toggle('expanded');
    noteElement.classList.toggle('collapsed');
}

function confirmDelete(form) {
    const noteElement = form.closest('li');
    noteElement.classList.add('hidden');

    setTimeout(() => {
        form.submit();
    }, 1000); // Match this with the CSS transition duration

    return false;
}

function toggleNoteExpand(note) {
    note.classList.toggle('expanded');
}