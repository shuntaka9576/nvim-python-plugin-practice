import typing

import pynvim as neovim

Args = typing.List[typing.Any]


@neovim.plugin
class TestPlugin(object):

    def __init__(self, nvim):
        self._nvim = nvim

    @neovim.function('_rpctest_init', sync=True)
    def init_channel(self, args: Args) -> None:
        self._nvim.vars['rpctest#_channel_id'] = self.nvim.channel_id
