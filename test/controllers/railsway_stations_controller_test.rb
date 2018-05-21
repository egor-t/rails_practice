# frozen_string_literal: true

require 'test_helper'

class RailswayStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @railsway_station = railsway_stations(:one)
  end

  test 'should get index' do
    get railsway_stations_url
    assert_response :success
  end

  test 'should get new' do
    get new_railsway_station_url
    assert_response :success
  end

  test 'should create railsway_station' do
    assert_difference('RailswayStation.count') do
      post railsway_stations_url, params: { railsway_station: { title: @railsway_station.title } }
    end

    assert_redirected_to railsway_station_url(RailswayStation.last)
  end

  test 'should show railsway_station' do
    get railsway_station_url(@railsway_station)
    assert_response :success
  end

  test 'should get edit' do
    get edit_railsway_station_url(@railsway_station)
    assert_response :success
  end

  test 'should update railsway_station' do
    patch railsway_station_url(@railsway_station), params: { railsway_station: { title: @railsway_station.title } }
    assert_redirected_to railsway_station_url(@railsway_station)
  end

  test 'should destroy railsway_station' do
    assert_difference('RailswayStation.count', -1) do
      delete railsway_station_url(@railsway_station)
    end

    assert_redirected_to railsway_stations_url
  end
end
