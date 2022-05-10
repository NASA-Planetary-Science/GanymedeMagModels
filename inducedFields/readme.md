# Induced field models
Expected values for the induced field from Ganymede are evaluated at the location of each spacecraft measurement by combining several models:
* Jupiter's intrinsic field: _JRM33,_ Connerney et al. (2022) https://doi.org/10.1029/2021JE007055
* Jupiter's current sheet: Connerney et al. (2020) https://doi.org/10.1029/2020JA028138
* Ganymede interior structure: _PlanetProfile,_ Vance et al. (2021) https://doi.org/10.1029/2020JE006418
  * _PlanetProfile_ is open source, available at: https://github.com/vancesteven/PlanetProfile
* Calculations tying these together: Styczinski et al. (2022) https://doi.org/10.1016/j.icarus.2021.114840
  * The moon-induction code is also open source; the repository is available at https://github.com/itsmoosh/moon-induction

For the induced field analysis, we use the following SPICE kernels, available from https://naif.jpl.nasa.gov/naif/data.html:
* Leapseconds: naif0012.tls
* Galileo:
  * Planetary constants: pck00006.tpc 
  * Generic SPK: jup365.bsp
  * Spacecraft SPK: s980326a.bsp, s000131a.bsp, s030916a.bsp
* Juno:
  * Planetary constants: pck00010.tpc
  * Generic SPK: jup380s.bsp
  * Spacecraft SPK: juno_rec_210513_210630_210707.bsp
  
The models for Jupiter's intrinsic and current sheet field (collectively referred to as JRM33+C2020) are evaluated at the location of Ganymede's center using the generic kernels listed above, over a time series consisting of 6e6 points spaced uniformly in time over the relevant spacecraft era, from JOI until September 1, 2003 for Galileo and until Jan 1, 2025 for Juno. The time series are evaluated separately for the next steps because orbital parameters can drift over time, affecting the relevant frequencies of oscillation at Ganymede, and the SPICE kernels account for this drift.

Next, the time series for the external (Jupiter intrinsic + current sheet) field applied to Ganymede is inverted using Principal Component Analysis to determine the amplitude and phase of magnetic oscillations, approximated as a uniform field represented by excitation moments with sinusoidal oscillation.

The interior structure of Ganymede is modeled using the _PlanetProfile_ framework, which incorporates spacecraft-determined measurements (such as bulk mass and radius), constraints (such as axial moment of inertia), and assumptions (such as dissolved salt concentration in the ocean), along with various geophysical and thermodynamic models, to determine a self-consistent 1D model of the body. Electrical conductivity values for ocean layers are determined using high-pressure measurements from Larionov and Kryukov (1984). For more information, see Vance et al. (2018, https://doi.org/10.1002/2017JE005341). We calculate the interior structure for three models:
  1. The "high" salinity case of 10 wt% MgSO4 (aq) in Ganymede's ocean, as studied in Vance et al. (2021). This model has an ice shell approximately 25 km thick and the (P- and T-dependent) ocean conductivity is evaluated as a function of depth in the ocean.
  1. The "low" salinity case of 1 wt% MgSO4 (aq) from Vance et al. (2021), which has an ice shell approximately 94 km thick and also includes depth-dependent conductivity.
  1. A "simple" case with a 120 km thick ice shell and a uniform ocean conductivity of 0.5 S/m. This case is intended to be analogous to models studied in Saur et al. (2015, https://doi.org/10.1002/2014JA020778).

The excitation moments for each spacecraft era and the interior conductivity structure models are then used to determine the expected induced magnetic moments as a function of time via the layer method of Srivastava (1966, https://doi.org/10.1111/j.1365-246X.1966.tb03090.x). The induced magnetic moments are then evaluated for each measurement time reported in the high-resolution PDS datasets for Ganymede flybys the relevant mission: GO-J-POS-6-SC-TRAJ-MOON-COORDS-V1.0 for Galileo and JNO-J-3-FGM-CAL-V1.0 for Juno.

Finally, the spacecraft locations relative to Ganymede are evaluated using the SPICE kernels listed above, and these locations are used to evaluate the induced magnetic field for each measurement time using the induced magnetic moments determined in the previous step.
