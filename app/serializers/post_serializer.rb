class PostSerializer < ActiveModel::Serializer
  attributes  :id,
              :title,
              :location,
              :job_type,
              :rate,
              :description,
              :company_name,
              :company_url,
              :company_logo,
              :how_to_apply,
              :how_to_apply_address,
              :contact_email,
              :posted,
              :path

end
