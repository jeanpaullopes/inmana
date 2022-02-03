defmodule Inmana.Supriment.SuprimentServices do
  alias Inmana.Supriment
  alias Inmana.Supriment.DAO

  def get_index() do
    DAO.get_all()
  end

  def get_index_restaurant(id) do
    DAO.get_supriment_by_restaurant(id)
  end

  def get_supriment(id) do
    DAO.get_supriment_by_id(id)
  end

  def create_supriment(params) do
    {:ok, supriment} = DAO.insert_supriment(params)
    supriment
  end

  def update_supriment(id, params) do
    {:ok, supriment} = DAO.update_supriment(id, params)
    supriment
  end
end
