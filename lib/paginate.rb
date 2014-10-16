module paginate

  def paginate(page: params[:page], :per_page)
   page=0
   self.limit(per_page).offset(page * per_page)
  end

end