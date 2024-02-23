## Add devices

* ONVIF (port 2020)

## Add View cards

```
title: Home
views:
  - path: default_view
    title: Home
    cards:
      - show_state: false
        show_name: true
        camera_view: live
        camera_image: camera.cctv1_mainstream
        type: picture-entity
        entity: camera.cctv1_mainstream
        name: CCTV1
        image: cctv1 mainStream
```

## Results
  
  <img src="https://github.com/leepro/tapo_cctv/blob/main/screenshots/ha-dashboard.png?raw=true" width="800">
