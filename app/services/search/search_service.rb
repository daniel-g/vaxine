# Un Service Object me da una interfaz específica
# para un problema que necesito resolver.
# En este caso la búsqueda general de users.
class Search::SearchService
  attr_accessor :form, :search

  def initialize(search_form)
    self.form = search_form
    self.search = User.all
  end

  def search!
    filter_email if form.email.present?
    search
  end

  private

  def filter_email
    self.search = search.where(
      'users.email like ?',
      "%#{ form.email.presence }%"
    )
  end
end
