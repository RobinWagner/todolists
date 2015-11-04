require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
    User.create(params)
  end

  def create_todolist(params)
    TodoList.create(list_name: params[:name], list_due_date: params[:due_date])
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    User.order(:updated_at).limit(limit).offset(offset)
  end

  def find_alllists(offset, limit)
    TodoList.order(list_due_date: :desc).offset(offset).limit(limit)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    User.all.where username: username
  end 

  def find_todolist_byname(list_name)
    TodoList.all.where list_name: list_name
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    User.find(id)
  end

  def get_todolist_byid(id)
    TodoList.find(id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
    User.find(id).update(password_digest: password_digest)
  end

  def update_listname(id, name)
    TodoList.find(id).update(list_name: name)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
    User.destroy(id)
  end 

  def delete_todolist(id)
    TodoList.delete(id)
  end
end
