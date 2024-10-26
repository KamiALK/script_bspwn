-- Define your custom function here
local function run_curr_python_file()
  -- Get the file name in the current buffer
  local file_name = vim.api.nvim_buf_get_name(0)

  if file_name:match("%.py$") then
    -- Create a new terminal window and run the command
    vim.api.nvim_command("vnew | term python3 " .. file_name)
  else
    vim.api.nvim_err_writeln("Error: Not a Python file")
  end
end

-- Create a command to run the Python file function
vim.api.nvim_create_user_command("RunPythonFile", run_curr_python_file, {})

return {}
