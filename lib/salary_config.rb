class SalaryConfig
  CONFIG_PATH = Rails.root.join('config', 'salary_config.yml')

  def self.change_reasons
    load_config['change_reasons']
  end

  def self.job_titles
    load_config['job_titles']
  end

  private

  def self.load_config
    YAML.load_file(CONFIG_PATH)
  end
end
