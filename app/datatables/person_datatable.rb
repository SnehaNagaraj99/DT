class PersonDatatable < AjaxDatatablesRails::Base

  def view_columns
     @view_columns ||= {
    first_name: { source: "Person.first_name", cond: :like, searchable: true, orderable: true },
    last_name:  { source: "Person.last_name",  cond: :like, nulls_last: true },
    email:      { source: "Person.email" },
    bio:        { source: "Person.bio" },
  }
  end

  def data
    records.map do |record|
      {
        first_name: record.first_name,
        last_name:  record.last_name,
        email:      record.email,
        bio:        record.bio,
        DT_RowId:   record.id, # This will automagically set the id attribute on the corresponding <tr> in the datatable
      }
    end
  end

  private

  def get_raw_records
     Person.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
