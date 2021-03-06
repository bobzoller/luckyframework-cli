require "../spec_helper"

describe "Initializing a new web project" do
  it "creates the project successfully" do
    puts "Running integration spec. This might take awhile...".colorize(:yellow)
    should_run_successfully "rm -rf ./test-project"
    should_run_successfully "crystal src/lucky.cr init test-project"
    FileUtils.cd "test-project" do
      should_run_successfully "crystal build src/server.cr"
    end
  end
end

private def should_run_successfully(command)
  Process.run(
    command,
    shell: true,
    output: true,
    error: true
  ).exit_status.should be_succeful
end

private def be_succeful
  eq 0
end
