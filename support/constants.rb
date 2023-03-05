# frozen_string_literal: true

OPTS = {
  noun: "(//ol[contains(@class,'sense')])[1]/descendant::span[@class='def']",
  idiom: "//span[@class='idm']",
  origin: "//span[@unbox='wordorigin']/descendant::span[@class='p']"
}.freeze

