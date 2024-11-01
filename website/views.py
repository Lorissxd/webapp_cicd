from flask import Blueprint, render_template, request, flash, redirect, session
from .db import create_note, find_note, delete_note
from .login_require import login_required

views = Blueprint('views', __name__)
collection_note = 'note'

@views.route('/home', methods=['GET', 'POST'])
@login_required
def notes():
    if request.method == 'POST':
        note_html = request.form.get('note_html')
        if len(note_html) < 1:
            flash('Note should have atleast 1 character', category='error')
            return redirect("/home")    
        else:
            user_id = session.get('user_id')
            
            create_note(note_html, user_id)
            flash('Note created!', category='success')
            
    user_id = session.get('user_id')
    all_notes = find_note(user_id)
    return render_template("home.html", all_notes=all_notes)


@views.route('/<id>/delete/', methods=['POST'])
@login_required
def delete(id):
    user_id = session.get('user_id')
    if not user_id:
        flash('User are not logged-in', category='error')
        return redirect('/login')
    
    result = delete_note(id, user_id)
    
    if result.deleted_count > 0:
        flash('Note deleted sucessfully', category="success")
    else:
        flash('Failed to delte note', category="error")
        
    return redirect("/home")
