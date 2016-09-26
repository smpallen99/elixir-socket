defmodule SocketTest do
  use ExUnit.Case, async: true

  test "default options" do
    args = Socket.arguments([])
    assert args == [active: false]
  end

  test "route option" do
    args = Socket.arguments([route: true])
    assert Keyword.get(args, :dontroute) == false
  end

  test "reuseaddr option" do
    args = Socket.arguments([reuseaddr: true])
    assert Keyword.get(args, :reuseaddr) == true
  end

  test "linger option" do
    args = Socket.arguments([linger: true])
    assert Keyword.get(args, :linger) == { true, true }
  end

  test "priority option" do
    args = Socket.arguments([priority: 1])
    assert Keyword.get(args, :priority) == 1
  end

  test "tos option" do
    args = Socket.arguments([tos: 1])
    assert Keyword.get(args, :tos) == 1
  end

  test "send timeout option" do
    args = Socket.arguments([send: [timeout: 5]])
    assert Keyword.get(args, :send_timeout) == 5
  end

  test "send timeout option with close" do
    args = Socket.arguments([send: [timeout: { 5, :close }]])
    assert Keyword.get(args, :send_timeout) == 5
    assert Keyword.get(args, :send_timeout_close)
  end

  test "send delay + timeout options" do
    args = Socket.arguments([send: [timeout: 5, delay: true]])
    assert Keyword.get(args, :send_timeout) == 5
    assert Keyword.get(args, :delay_send)
  end

  test "buffer + timeout options" do
    args = Socket.arguments([send: [timeout: 5, buffer: 10]])
    assert Keyword.get(args, :send_timeout) == 5
    assert Keyword.get(args, :sndbuf) == 10
  end

  test "recv buffer option" do
    args = Socket.arguments([recv: [buffer: 5]])
    assert Keyword.get(args, :recbuf) == 5
  end
end
