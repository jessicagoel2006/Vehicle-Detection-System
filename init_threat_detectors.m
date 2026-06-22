function cfg = init_threat_detectors()
%INIT_THREAT_DETECTORS
%  Defines all software-based threat detector configurations.
%  No physical sensors — pure mathematical models.

    %% Pothole Detector — road surface anomaly model
    cfg.pothole.zones     = [40, 130, 220];   % x-positions of potholes (m)
    cfg.pothole.radius    = 8;                % detection radius (m)
    cfg.pothole.severity  = [0.6, 0.8, 0.5]; % severity scores 0-1

    %% Collision Detector — Time-To-Collision (TTC) model
    %  TTC = relative_distance / relative_velocity
    %  Alert if TTC < 3s, Danger if TTC < 1.5s
    cfg.collision.alertTTC  = 3.0;   % seconds
    cfg.collision.dangerTTC = 1.5;   % seconds
    cfg.collision.maxRange  = 60;    % metres

    %% Pedestrian Detector — proximity + trajectory prediction
    cfg.pedestrian.alertDist  = 20;  % metres
    cfg.pedestrian.dangerDist = 8;   % metres

    %% Curve Risk Detector — curvature × speed model
    %  Risk = v² × κ  where κ = curvature of road
    cfg.curve.dangerThreshold = 50;  % m/s² equivalent

    %% Tailgating Detector — following distance model
    %  Safe following = 2 seconds × ego speed
    cfg.tailgate.safeTimeGap = 2.0;  % seconds

    fprintf('   -> 5 software threat detectors initialised:\n');
    fprintf('      [1] Pothole anomaly detector\n');
    fprintf('      [2] Collision TTC model\n');
    fprintf('      [3] Pedestrian proximity detector\n');
    fprintf('      [4] Curve risk model\n');
    fprintf('      [5] Tailgating detector\n');
end
