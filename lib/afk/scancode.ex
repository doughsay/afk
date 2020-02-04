defmodule AFK.Scancode do
  @moduledoc false

  @keys [
    {0x04, :a},
    {0x05, :b},
    {0x06, :c},
    {0x07, :d},
    {0x08, :e},
    {0x09, :f},
    {0x0A, :g},
    {0x0B, :h},
    {0x0C, :i},
    {0x0D, :j},
    {0x0E, :k},
    {0x0F, :l},
    {0x10, :m},
    {0x11, :n},
    {0x12, :o},
    {0x13, :p},
    {0x14, :q},
    {0x15, :r},
    {0x16, :s},
    {0x17, :t},
    {0x18, :u},
    {0x19, :v},
    {0x1A, :w},
    {0x1B, :x},
    {0x1C, :y},
    {0x1D, :z},
    {0x1E, :"1"},
    {0x1F, :"2"},
    {0x20, :"3"},
    {0x21, :"4"},
    {0x22, :"5"},
    {0x23, :"6"},
    {0x24, :"7"},
    {0x25, :"8"},
    {0x26, :"9"},
    {0x27, :"0"},
    {0x28, :enter},
    {0x29, :escape},
    {0x2A, :backspace},
    {0x2B, :tab},
    {0x2C, :space},
    {0x2D, :minus},
    {0x2E, :equals},
    {0x2F, :left_square_bracket},
    {0x30, :right_square_bracket},
    {0x31, :backslash},
    {0x33, :semicolon},
    {0x34, :single_quote},
    {0x35, :grave},
    {0x36, :comma},
    {0x37, :period},
    {0x38, :slash},
    {0x39, :caps_lock},
    {0x3A, :f1},
    {0x3B, :f2},
    {0x3C, :f3},
    {0x3D, :f4},
    {0x3E, :f5},
    {0x3F, :f6},
    {0x40, :f7},
    {0x41, :f8},
    {0x42, :f9},
    {0x43, :f10},
    {0x44, :f11},
    {0x45, :f12},
    {0x46, :print_screen},
    {0x47, :scroll_lock},
    {0x48, :pause},
    {0x49, :insert},
    {0x4A, :home},
    {0x4B, :page_up},
    {0x4C, :delete},
    {0x4D, :end},
    {0x4E, :page_down},
    {0x4F, :right},
    {0x50, :left},
    {0x51, :down},
    {0x52, :up},
    {0x65, :application}
  ]

  @modifiers [
    {0x01, :left_control},
    {0x02, :left_shift},
    {0x04, :left_alt},
    {0x08, :left_super},
    {0x10, :right_control},
    {0x20, :right_shift},
    {0x40, :right_alt},
    {0x80, :right_super}
  ]

  @type t ::
          unquote(
            Enum.reduce(
              Enum.uniq(Enum.map(@keys(), &elem(&1, 0)) ++ Enum.map(@modifiers(), &elem(&1, 0))),
              &{:|, [], [&1, &2]}
            )
          )

  @spec scancode(keycode :: AFK.Keycode.with_scancode()) :: t
  def scancode(keycode), do: __MODULE__.Protocol.scancode(keycode)

  @spec keys :: [{t, AFK.Keycode.Key.key()}]
  def keys, do: @keys

  @spec modifiers :: [{t, AFK.Keycode.Modifier.modifier()}]
  def modifiers, do: @modifiers
end
