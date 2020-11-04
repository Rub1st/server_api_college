class SingleTableQuery

    def create (model, data_params)
        data = model.new(data_params)

        if data.save
            d = model.find(data.id)
            {json: d, status: 201}
        else
            {json: {errors: [*data.errors]}, status: :unprocessable_entity}
        end
    end

	def update (model, data_params,id)
  	  d = model.find(id)
      if d.update_attributes(data_params)
          {json: d, status: :ok }
      else
          { json: { errors: d.errors }, status: :unprocessable_entity }
      end
  end

    def destroy (model, id)
        d = model.find(id)
        d.destroy
    end

    def index (model)
        d = model.find_each.map { |el| {id: el.id, name: el.name} }
        {json: d, status: :ok}
    end

    def show (model, id)
        d = model.where(id: id).map { |el| {id: el.id, name: el.name} }
        {json: d, status: 201}
    end

end