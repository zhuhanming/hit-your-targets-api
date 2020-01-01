module V1
  class SubtodosController < ApplicationController
    before_action :set_todo
    before_action :set_todo_subtodo, only: [:show, :update, :destroy]

    # GET /todos/:todo_id/subtodos
    def index
      json_response(@todo.subtodos)
    end

    # GET /todos/:todo_id/subtodos/:id
    def show
      json_response(@subtodo)
    end

    # POST /todos/:todo_id/subtodos
    def create
      @todo.subtodos.create!(subtodo_params)
      json_response(@todo, :created)
    end

    # PUT /todos/:todo_id/subtodos/:id
    def update
      @subtodo.update(subtodo_params)
      json_response(@todo)
    end

    # DELETE /todos/:todo_id/subtodos/:id
    def destroy
      @subtodo.destroy
      json_response(@todo)
    end

    private

    def subtodo_params
      params.permit(:title, :start_time, :end_time, :completed)
    end

    def set_todo
      @todo = Todo.find(params[:todo_id])
    end

    def set_todo_subtodo
      @subtodo = @todo.subtodos.find_by!(id: params[:id]) if @todo
    end
  end
end
