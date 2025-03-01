import PropTypes from "prop-types";
import React from "react";
import AwesomeSlider from 'react-awesome-slider';
import withAutoplay from 'react-awesome-slider/dist/autoplay';
import 'react-awesome-slider/dist/styles.css';
import 'react-awesome-slider/dist/custom-animations/cube-animation.css';

const HeroSliderStatic = ({
  string,
  pitch1,
  pitch2,
  pitch3,
  sliderText,
  sliderImage,
}) => {
  const AutoplaySlider = withAutoplay(AwesomeSlider);

  const data = [
    {
      title: 'Product 1',
      src: 'assets/sliders/slider1.jpg'
    },
    {
      title: 'Product 2',
      src: 'assets/sliders/slider2.jpg'
    },
    {
      title: 'Product 3',
      src: 'assets/sliders/slider3.jpg'
    },
    {
      title: 'Product 4',
      src: 'assets/sliders/slider4.jpg'
    },
    {
      title: 'Product 5',
      src: 'assets/sliders/slider5.jpg'
    },
  ];  
  
  return (
    <div className="row">
      <div className="col-md-4 ml-auto order-md-2 align-self-start">
        <div className="site-block-cover-content">
          <h2 className="sub-title">{pitch1}</h2>
          <h1>{pitch2}</h1>
          <p>
            <a href="#" className="btn btn-black rounded-0">
              {pitch3}
            </a>
          </p>
        </div>
      </div>
      <div className="col-md-8 order-1 align-self-end">

        <AutoplaySlider animation="cubeAnimation" play={true} interval={6000}>
          {data && data.length > 0 &&
              data.map((item, key) => {
                return (
                  <div key={key} data-src={item.src} />
                );
            })}
        </AutoplaySlider>
      </div>
    </div>
  );
};

HeroSliderStatic.propTypes = {
  pitch1: PropTypes.string,
  pitch2: PropTypes.string,
  pitch3: PropTypes.string,
  text: PropTypes.string,
  image: PropTypes.string,
};

export default HeroSliderStatic;
