defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    case planet do
      :earth ->
        calc_age(seconds, 1)
      :mercury ->
        calc_age(seconds, 0.2408467)
      :venus ->
        calc_age(seconds, 0.61519726)
      :mars ->
        calc_age(seconds, 1.8808158)
      :jupiter ->
        calc_age(seconds, 11.862615)
      :saturn ->
        calc_age(seconds, 29.447498)
      :uranus ->
        calc_age(seconds, 84.016846)
      :neptune ->
        calc_age(seconds, 164.79132)
    end
  end

  defp calc_age(seconds, earth_years) do
    Float.round(seconds / (31557600 * earth_years), 2)
  end
end
