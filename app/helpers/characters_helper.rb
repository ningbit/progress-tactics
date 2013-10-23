module CharactersHelper

  def image_body(character)
    "/images/jobs/" + character.current_job_class.name.gsub(' ','') + character.color.to_s + character.gender + "-SW.gif"
  end



  def image_face(character)
    "/images/jobs/" + character.current_job_class.name.gsub(" ","") + character.color.to_s + character.gender + ".gif"
  end

  def job_image_body(job)
    "/images/jobs/" + job.name.gsub(' ','') + job.character.color.to_s + job.character.gender + "-SW.gif"
  end

  def current_job_image_body(character)
     "/images/jobs/" + character.current_job_class.name.gsub(' ','') + character.color.to_s + character.gender + "-S.gif"  
  end  

end
