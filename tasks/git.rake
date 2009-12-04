namespace :git do
  namespace :stats do
    desc "Show untracked files"
    task :untracked do
        `git status --untracked`
    end

    desc "show number of changes"
    task :changes do
      `git diff --shortstat`
    end

    desc "see the number of commits"
    task :commits do
      `git log | grep ^commit | wc -l`
    end
  end

  desc "Commit all modified files and pull"
  task :cpull do
    `git commit -a -m #{ENV["M"]}`
    `git pull`
  end

  desc "Commit all modified files and pull"
  task :commit do
    `git commit -a -m "#{ENV["M"]}"`
  end

  desc "Pull from origin/master"
  task :master_pull do
    `git pull origin master`
  end

  desc "Undo all local changes and go back to the last commit"
  task :reset do
    `git reset --hard HEAD`
  end

  desc "Create a tag and push to origin"
  task :tag do
    `git tag #{ENV["TAG"]}`
    `git push`
    `git push --tags`
  end
  
  desc "check out a remote branch and set it up to track changes"
  task :co_remote do
    `git checkout -t origin/#{ENV["TAG"]}`
  end

  namespace :tags do
    desc "Deletes a tag and then removes the remote tag"
    task :delete_remote do
      `git tag -d #{ENV["TAG"]}`
      `git push origin :#{ENV["TAG"]}`
    end
  end
end
