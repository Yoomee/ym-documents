module YmDocuments::Document
  def self.included(base)
    base.extend(FriendlyId)
    base.send(:file_accessor, :attachment)
    base.send(:friendly_id, :slug_candidates, use: :slugged)
    base.validates :attachment, presence: true
    base.validates :url, uniqueness: true
    base.validate :file_not_in_blacklist
    base.extend(ClassMethods)
  end

  module ClassMethods
    def blacklist
      ["ade", "adp", "app", "asp", "bas", "bat", "cer", "chm", "cmd", "com", "cpl", "crt", "csh", "der", "exe", "fxp", "gadget", "hlp", "hta", "inf", "ins", "isp", "its", "js",
       "jse", "ksh", "lnk", "mad", "maf", "mag", "mam", "maq", "mar", "mas", "mat", "mau", "mav", "maw", "mda", "mdb", "mde", "mdt", "mdw", "mdz", "msc", "msh", "msh1", "msh2", "mshxml", "msh1xml", 
       "msh2xml", "msi", "msp", "mst", "ops", "pcd", "pif", "plg", "prf", "prg", "pst", "reg", "scf", "scr", "sct", "shb", "shs", "ps1", "ps1xml", "ps2", "ps2xml", "psc1", "psc2", "tmp", "url",
        "vb", "vbe", "vbs", "vsmacros", "vsw", "ws," "wsc", "wsf", "wsh", "xnk"]
    end
  end

  def slug_candidates
    [
      :url,
      [:url, :name_and_sequence]
    ]
  end

  def name_and_sequence
    slug = normalize_friendly_id(url)
    "#{slug}--#{attributes['id']}"
  end

  def file_not_in_blacklist
    if attachment && Document.blacklist.include?(attachment.ext)
      errors.add(:attachment, "This filetype is not allowed")
    end
  end
end
