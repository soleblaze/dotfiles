return {
  "ThePrimeagen/refactoring.nvim",
  config = function()
    require('refactoring').setup({
      prompt_func_return_type = {
        go = true,
      },
      prompt_func_param_type = {
        go = true,
      }
    })
  end
}
