def load_seed (name)
    require File.join(__dir__, 'seeds', name + '_seeder')
end

load_seed 'users'